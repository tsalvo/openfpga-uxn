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
-- Submodules: 87
entity sta_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_bbbe252c;
architecture arch of sta_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2624_c6_0657]
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2624_c1_79c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2624_c2_a687]
signal t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l2624_c2_a687]
signal n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2624_c2_a687]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2625_c3_d9d4[uxn_opcodes_h_l2625_c3_d9d4]
signal printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2630_c11_94cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2630_c7_6da5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_8fb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2633_c7_1abf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2635_c3_a177]
signal CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2638_c11_3823]
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2638_c7_1a7c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_5482]
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2641_c7_fd27]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2642_c3_0556]
signal BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_59a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2645_c7_223c]
signal n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2645_c7_223c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2648_c11_3cba]
signal BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2648_c7_4fa7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2652_c32_9241]
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2652_c32_88e9]
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2652_c32_8eb1]
signal MUX_uxn_opcodes_h_l2652_c32_8eb1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_5354]
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_a396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_a396]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2657_c7_a396]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd01( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657
BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left,
BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right,
BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output);

-- t16_MUX_uxn_opcodes_h_l2624_c2_a687
t16_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- n8_MUX_uxn_opcodes_h_l2624_c2_a687
n8_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687
result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687
result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

-- printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4
printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4 : entity work.printf_uxn_opcodes_h_l2625_c3_d9d4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output);

-- t16_MUX_uxn_opcodes_h_l2630_c7_6da5
t16_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- n8_MUX_uxn_opcodes_h_l2630_c7_6da5
n8_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5
result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5
result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5
result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5
result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5
result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output);

-- t16_MUX_uxn_opcodes_h_l2633_c7_1abf
t16_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- n8_MUX_uxn_opcodes_h_l2633_c7_1abf
n8_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf
result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf
result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf
result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2635_c3_a177
CONST_SL_8_uxn_opcodes_h_l2635_c3_a177 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x,
CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left,
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right,
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output);

-- t16_MUX_uxn_opcodes_h_l2638_c7_1a7c
t16_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- n8_MUX_uxn_opcodes_h_l2638_c7_1a7c
n8_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c
result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output);

-- t16_MUX_uxn_opcodes_h_l2641_c7_fd27
t16_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- n8_MUX_uxn_opcodes_h_l2641_c7_fd27
n8_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27
result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27
result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27
result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556
BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left,
BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right,
BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output);

-- n8_MUX_uxn_opcodes_h_l2645_c7_223c
n8_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c
result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c
result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c
result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c
result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba
BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left,
BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right,
BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output);

-- n8_MUX_uxn_opcodes_h_l2648_c7_4fa7
n8_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7
result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241
BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left,
BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right,
BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9
BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left,
BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right,
BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output);

-- MUX_uxn_opcodes_h_l2652_c32_8eb1
MUX_uxn_opcodes_h_l2652_c32_8eb1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2652_c32_8eb1_cond,
MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue,
MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse,
MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right,
BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396
result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output,
 t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output,
 t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output,
 t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output,
 CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output,
 t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output,
 t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output,
 n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output,
 n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output,
 MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_aea4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_af61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_2c6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_2492 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_c123 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_2519 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2645_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_a149_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2664_l2619_DUPLICATE_f543_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_c123 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2643_c3_c123;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_aea4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_aea4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_2492 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_2492;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_af61 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2631_c3_af61;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_2519 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2646_c3_2519;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_2c6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_2c6a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_59a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2652_c32_9241] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_left;
     BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output := BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2630_c11_94cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2638_c11_3823] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_left;
     BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output := BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2645_c7_223c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2648_c11_3cba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2624_c6_0657] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_left;
     BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output := BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_a149 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_a149_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2657_c11_5354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_8fb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_5482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_left;
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output := BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_9241_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c6_0657_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2630_c11_94cd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_8fb9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_3823_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_5482_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_59a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2648_c11_3cba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2657_c11_5354_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_a149_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_a149_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_1d0a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_a5ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2648_l2645_l2641_DUPLICATE_7554_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_85ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2657_l2624_l2645_l2641_DUPLICATE_41e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2648_l2645_l2641_DUPLICATE_9691_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2638_l2633_l2630_l2624_l2648_l2645_l2641_DUPLICATE_8c7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2645_c7_223c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2642_c3_0556] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_left;
     BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output := BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2635_c3_a177] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output := CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2657_c7_a396] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2652_c32_88e9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_left;
     BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output := BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2624_c1_79c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2657_c7_a396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;

     -- n8_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2657_c7_a396] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_88e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2642_c3_0556_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2635_c3_a177_return_output;
     VAR_printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2624_c1_79c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2657_c7_a396_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- printf_uxn_opcodes_h_l2625_c3_d9d4[uxn_opcodes_h_l2625_c3_d9d4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2625_c3_d9d4_uxn_opcodes_h_l2625_c3_d9d4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2652_c32_8eb1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2652_c32_8eb1_cond <= VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_cond;
     MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue <= VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iftrue;
     MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse <= VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output := MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue := VAR_MUX_uxn_opcodes_h_l2652_c32_8eb1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2648_c7_4fa7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2648_c7_4fa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- t16_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- n8_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2645_c7_223c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2645_c7_223c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_fd27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_fd27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2638_c7_1a7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- n8_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_1a7c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c7_1abf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;

     -- n8_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_1abf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2630_c7_6da5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2630_c7_6da5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c2_a687] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2664_l2619_DUPLICATE_f543 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2664_l2619_DUPLICATE_f543_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c2_a687_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c2_a687_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2664_l2619_DUPLICATE_f543_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2664_l2619_DUPLICATE_f543_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
