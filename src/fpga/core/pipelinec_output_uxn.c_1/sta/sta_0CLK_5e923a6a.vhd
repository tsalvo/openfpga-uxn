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
-- Submodules: 92
entity sta_0CLK_5e923a6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_5e923a6a;
architecture arch of sta_0CLK_5e923a6a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2669_c6_e5b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2669_c1_a2ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2669_c2_0dff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2670_c3_fc60[uxn_opcodes_h_l2670_c3_fc60]
signal printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2675_c11_8701]
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2675_c7_8ea8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_69c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2678_c7_0a83]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2680_c3_fcea]
signal CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_e205]
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2683_c7_243e]
signal n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2683_c7_243e]
signal t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2683_c7_243e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_c044]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2686_c7_27e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2687_c3_3bb8]
signal BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_cfc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2690_c7_3043]
signal n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2690_c7_3043]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_7f77]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2693_c7_42b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2697_c32_32d0]
signal BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2697_c32_4b5f]
signal BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2697_c32_f220]
signal MUX_uxn_opcodes_h_l2697_c32_f220_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2697_c32_f220_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2697_c32_f220_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2697_c32_f220_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_f4df]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2699_c7_17c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2699_c7_17c1]
signal result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2699_c7_17c1]
signal result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_17c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2699_c7_17c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_0ded]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_2ab2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2705_c7_2ab2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_read := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6
BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output);

-- n8_MUX_uxn_opcodes_h_l2669_c2_0dff
n8_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- t16_MUX_uxn_opcodes_h_l2669_c2_0dff
t16_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff
result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff
result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff
result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff
result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

-- printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60
printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60 : entity work.printf_uxn_opcodes_h_l2670_c3_fc60_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left,
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right,
BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output);

-- n8_MUX_uxn_opcodes_h_l2675_c7_8ea8
n8_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- t16_MUX_uxn_opcodes_h_l2675_c7_8ea8
t16_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8
result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output);

-- n8_MUX_uxn_opcodes_h_l2678_c7_0a83
n8_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- t16_MUX_uxn_opcodes_h_l2678_c7_0a83
t16_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83
result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83
result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83
result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83
result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea
CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x,
CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output);

-- n8_MUX_uxn_opcodes_h_l2683_c7_243e
n8_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- t16_MUX_uxn_opcodes_h_l2683_c7_243e
t16_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e
result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e
result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e
result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e
result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e
result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output);

-- n8_MUX_uxn_opcodes_h_l2686_c7_27e5
n8_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- t16_MUX_uxn_opcodes_h_l2686_c7_27e5
t16_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5
result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5
result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5
result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8
BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left,
BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right,
BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output);

-- n8_MUX_uxn_opcodes_h_l2690_c7_3043
n8_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043
result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043
result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043
result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043
result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output);

-- n8_MUX_uxn_opcodes_h_l2693_c7_42b9
n8_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9
result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9
result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9
result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0
BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left,
BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right,
BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f
BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left,
BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right,
BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output);

-- MUX_uxn_opcodes_h_l2697_c32_f220
MUX_uxn_opcodes_h_l2697_c32_f220 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2697_c32_f220_cond,
MUX_uxn_opcodes_h_l2697_c32_f220_iftrue,
MUX_uxn_opcodes_h_l2697_c32_f220_iffalse,
MUX_uxn_opcodes_h_l2697_c32_f220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1
result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1
result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond,
result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1
result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2
result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output,
 n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output,
 n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output,
 n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output,
 CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output,
 n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output,
 n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output,
 n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output,
 n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output,
 MUX_uxn_opcodes_h_l2697_c32_f220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_66dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_6722 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2681_c3_1758 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_b3b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_97d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_4212 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2690_c7_3043_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2697_c32_f220_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2697_c32_f220_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2687_l2679_DUPLICATE_ae82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2710_l2664_DUPLICATE_e975_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2681_c3_1758 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2681_c3_1758;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_b3b4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_b3b4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_97d6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_97d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_6722 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_6722;
     VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_4212 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_4212;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_66dc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_66dc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := n8;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2690_c7_3043_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_cfc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_e205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_left;
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output := BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2687_l2679_DUPLICATE_ae82 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2687_l2679_DUPLICATE_ae82_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_69c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_0ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_c044] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_f4df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_7f77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c6_e5b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2697_c32_32d0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_left;
     BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output := BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2675_c11_8701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_left;
     BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output := BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2697_c32_32d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c6_e5b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2675_c11_8701_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_69c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_e205_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_c044_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_cfc8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_7f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_f4df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_0ded_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2687_l2679_DUPLICATE_ae82_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2687_l2679_DUPLICATE_ae82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2669_l2693_l2690_l2686_DUPLICATE_a653_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_4db6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2699_l2693_l2690_l2686_DUPLICATE_ac8f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2683_l2678_l2705_l2675_l2669_l2693_l2690_l2686_DUPLICATE_f02c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2690_l2686_DUPLICATE_2b50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2693_l2690_l2686_DUPLICATE_0b40_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2683_l2678_l2675_l2699_l2669_l2693_l2690_l2686_DUPLICATE_18da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2690_c7_3043_return_output;
     -- n8_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2699_c7_17c1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2687_c3_3bb8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_left;
     BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output := BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_2ab2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2699_c7_17c1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output := result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2680_c3_fcea] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output := CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2699_c7_17c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2705_c7_2ab2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2697_c32_4b5f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_left;
     BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output := BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2669_c1_a2ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2697_c32_f220_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2697_c32_4b5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2687_c3_3bb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2680_c3_fcea_return_output;
     VAR_printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2669_c1_a2ea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2705_c7_2ab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2699_c7_17c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;

     -- MUX[uxn_opcodes_h_l2697_c32_f220] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2697_c32_f220_cond <= VAR_MUX_uxn_opcodes_h_l2697_c32_f220_cond;
     MUX_uxn_opcodes_h_l2697_c32_f220_iftrue <= VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iftrue;
     MUX_uxn_opcodes_h_l2697_c32_f220_iffalse <= VAR_MUX_uxn_opcodes_h_l2697_c32_f220_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2697_c32_f220_return_output := MUX_uxn_opcodes_h_l2697_c32_f220_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_17c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- printf_uxn_opcodes_h_l2670_c3_fc60[uxn_opcodes_h_l2670_c3_fc60] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2670_c3_fc60_uxn_opcodes_h_l2670_c3_fc60_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue := VAR_MUX_uxn_opcodes_h_l2697_c32_f220_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2699_c7_17c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2693_c7_42b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_42b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- n8_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2690_c7_3043] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_3043_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c7_27e5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_27e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_243e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2683_c7_243e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;
     -- n8_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_0a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_0a83_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2675_c7_8ea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2675_c7_8ea8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c2_0dff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2710_l2664_DUPLICATE_e975 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2710_l2664_DUPLICATE_e975_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2669_c2_0dff_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2710_l2664_DUPLICATE_e975_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2710_l2664_DUPLICATE_e975_return_output;
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
