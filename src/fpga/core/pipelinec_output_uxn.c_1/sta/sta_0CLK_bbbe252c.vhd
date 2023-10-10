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
-- BIN_OP_EQ[uxn_opcodes_h_l2600_c6_1e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c1_2504]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2600_c2_e6cd]
signal t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2601_c3_acc9[uxn_opcodes_h_l2601_c3_acc9]
signal printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_459a]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2606_c7_e9d4]
signal t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_eedd]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2609_c7_2b8b]
signal t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2611_c3_b45f]
signal CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2614_c11_59d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2614_c7_6dc5]
signal t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_3fcf]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_d733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2617_c7_d733]
signal n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2617_c7_d733]
signal t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2618_c3_8c19]
signal BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_0649]
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2621_c7_39ed]
signal n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_1885]
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_4889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2624_c7_4889]
signal n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2628_c32_e16a]
signal BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2628_c32_c63a]
signal BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2628_c32_6b79]
signal MUX_uxn_opcodes_h_l2628_c32_6b79_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2628_c32_6b79_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_50a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c7_4d3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2633_c7_4d3e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_4d3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a
BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- n8_MUX_uxn_opcodes_h_l2600_c2_e6cd
n8_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- t16_MUX_uxn_opcodes_h_l2600_c2_e6cd
t16_MUX_uxn_opcodes_h_l2600_c2_e6cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond,
t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue,
t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse,
t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

-- printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9
printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9 : entity work.printf_uxn_opcodes_h_l2601_c3_acc9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- n8_MUX_uxn_opcodes_h_l2606_c7_e9d4
n8_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- t16_MUX_uxn_opcodes_h_l2606_c7_e9d4
t16_MUX_uxn_opcodes_h_l2606_c7_e9d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond,
t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue,
t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse,
t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- n8_MUX_uxn_opcodes_h_l2609_c7_2b8b
n8_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- t16_MUX_uxn_opcodes_h_l2609_c7_2b8b
t16_MUX_uxn_opcodes_h_l2609_c7_2b8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond,
t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue,
t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse,
t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f
CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x,
CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0
BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5
result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- n8_MUX_uxn_opcodes_h_l2614_c7_6dc5
n8_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- t16_MUX_uxn_opcodes_h_l2614_c7_6dc5
t16_MUX_uxn_opcodes_h_l2614_c7_6dc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond,
t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue,
t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse,
t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733
result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733
result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733
result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- n8_MUX_uxn_opcodes_h_l2617_c7_d733
n8_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- t16_MUX_uxn_opcodes_h_l2617_c7_d733
t16_MUX_uxn_opcodes_h_l2617_c7_d733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond,
t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue,
t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse,
t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19
BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left,
BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right,
BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed
result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed
result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed
result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- n8_MUX_uxn_opcodes_h_l2621_c7_39ed
n8_MUX_uxn_opcodes_h_l2621_c7_39ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond,
n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue,
n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse,
n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889
result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889
result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- n8_MUX_uxn_opcodes_h_l2624_c7_4889
n8_MUX_uxn_opcodes_h_l2624_c7_4889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond,
n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue,
n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse,
n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a
BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left,
BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right,
BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a
BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left,
BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right,
BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output);

-- MUX_uxn_opcodes_h_l2628_c32_6b79
MUX_uxn_opcodes_h_l2628_c32_6b79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2628_c32_6b79_cond,
MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue,
MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse,
MUX_uxn_opcodes_h_l2628_c32_6b79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output,
 CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output,
 MUX_uxn_opcodes_h_l2628_c32_6b79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_eab3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_2649 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_06e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_d38c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_2112 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_b823 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2621_c7_39ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2618_l2610_DUPLICATE_7e05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2595_l2640_DUPLICATE_d619_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_d38c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_d38c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_2649 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_2649;
     VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_eab3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_eab3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_2112 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_2112;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_b823 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_b823;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_06e9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_06e9;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2614_c11_59d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_eedd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c6_1e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_0649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_left;
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output := BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_3fcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2621_c7_39ed_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_50a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_459a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2628_c32_e16a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_left;
     BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output := BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_1885] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_left;
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output := BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2618_l2610_DUPLICATE_7e05 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2618_l2610_DUPLICATE_7e05_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2628_c32_e16a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c6_1e4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_459a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_eedd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2614_c11_59d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_3fcf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_0649_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_1885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_50a7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2618_l2610_DUPLICATE_7e05_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2618_l2610_DUPLICATE_7e05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_bfc0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_aae8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2624_l2621_l2617_l2614_DUPLICATE_6495_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_edf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2609_l2606_l2633_l2600_l2621_l2617_l2614_DUPLICATE_b0b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2606_l2624_l2621_l2617_l2614_DUPLICATE_9792_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2609_l2606_l2600_l2624_l2621_l2617_l2614_DUPLICATE_17b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2621_c7_39ed_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_4d3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2600_c1_2504] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2618_c3_8c19] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_left;
     BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output := BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2628_c32_c63a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_left;
     BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output := BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c7_4d3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- n8_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2633_c7_4d3e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2611_c3_b45f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output := CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2628_c32_c63a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2618_c3_8c19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2611_c3_b45f_return_output;
     VAR_printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2600_c1_2504_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c7_4d3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     -- t16_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- printf_uxn_opcodes_h_l2601_c3_acc9[uxn_opcodes_h_l2601_c3_acc9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2601_c3_acc9_uxn_opcodes_h_l2601_c3_acc9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- MUX[uxn_opcodes_h_l2628_c32_6b79] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2628_c32_6b79_cond <= VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_cond;
     MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue <= VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iftrue;
     MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse <= VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_return_output := MUX_uxn_opcodes_h_l2628_c32_6b79_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue := VAR_MUX_uxn_opcodes_h_l2628_c32_6b79_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- n8_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- t16_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_4889] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_4889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- t16_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_39ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_39ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_d733] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_d733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     -- n8_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2614_c7_6dc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2614_c7_6dc5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;
     -- n8_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_2b8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_2b8b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_e9d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_e9d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2600_c2_e6cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2595_l2640_DUPLICATE_d619 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2595_l2640_DUPLICATE_d619_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c2_e6cd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2595_l2640_DUPLICATE_d619_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2595_l2640_DUPLICATE_d619_return_output;
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
