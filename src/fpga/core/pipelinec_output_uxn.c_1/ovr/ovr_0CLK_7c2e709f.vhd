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
-- Submodules: 66
entity ovr_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_7c2e709f;
architecture arch of ovr_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l302_c6_8101]
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l302_c2_4c5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l307_c11_4df6]
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l307_c7_4d0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l310_c11_c6a6]
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l310_c7_7eef]
signal n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l310_c7_7eef]
signal t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_7eef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l314_c11_3def]
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_e0a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l317_c11_37ae]
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l317_c7_d404]
signal n8_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_d404]
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l320_c32_e370]
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l320_c32_ed1b]
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l320_c32_fbfe]
signal MUX_uxn_opcodes_h_l320_c32_fbfe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l320_c32_fbfe_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l322_c11_dbaa]
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l322_c7_0ad0]
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_0ad0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_0ad0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_0ad0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_0ad0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l328_c11_7b92]
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l328_c7_a9ed]
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l328_c7_a9ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c7_a9ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l328_c7_a9ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_c06c]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l332_c7_1b61]
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_1b61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_1b61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_1b61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_9e8a]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1753]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1753]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101
BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left,
BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right,
BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output);

-- n8_MUX_uxn_opcodes_h_l302_c2_4c5e
n8_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- t8_MUX_uxn_opcodes_h_l302_c2_4c5e
t8_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6
BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left,
BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right,
BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output);

-- n8_MUX_uxn_opcodes_h_l307_c7_4d0e
n8_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- t8_MUX_uxn_opcodes_h_l307_c7_4d0e
t8_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e
result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output);

-- n8_MUX_uxn_opcodes_h_l310_c7_7eef
n8_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- t8_MUX_uxn_opcodes_h_l310_c7_7eef
t8_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef
result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def
BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right,
BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output);

-- n8_MUX_uxn_opcodes_h_l314_c7_e0a0
n8_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0
result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae
BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output);

-- n8_MUX_uxn_opcodes_h_l317_c7_d404
n8_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l317_c7_d404_cond,
n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404
result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l320_c32_e370
BIN_OP_AND_uxn_opcodes_h_l320_c32_e370 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left,
BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right,
BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b
BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left,
BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right,
BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output);

-- MUX_uxn_opcodes_h_l320_c32_fbfe
MUX_uxn_opcodes_h_l320_c32_fbfe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l320_c32_fbfe_cond,
MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue,
MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse,
MUX_uxn_opcodes_h_l320_c32_fbfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa
BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right,
BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0
result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92
BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left,
BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right,
BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed
result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c
BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61
result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output,
 n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output,
 n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output,
 n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output,
 n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output,
 n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output,
 BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output,
 BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output,
 MUX_uxn_opcodes_h_l320_c32_fbfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_8653 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_469d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_b378 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_e879 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_60d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_e98d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e821 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l317_l332_DUPLICATE_9c1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l341_l298_DUPLICATE_9230_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_b378 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l312_c3_b378;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_469d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l308_c3_469d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_60d7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l325_c3_60d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_e879 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_e879;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_e98d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_e98d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_8653 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l304_c3_8653;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e821 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_e821;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l317_l332_DUPLICATE_9c1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l317_l332_DUPLICATE_9c1e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l317_c11_37ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l320_c32_e370] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_left;
     BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output := BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l314_c11_3def] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_left;
     BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output := BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l328_c11_7b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_left;
     BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output := BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l307_c11_4df6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_left;
     BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output := BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l322_c11_dbaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l302_c6_8101] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_left;
     BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output := BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l310_c11_c6a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_c06c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_9e8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l320_c32_e370_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l302_c6_8101_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l307_c11_4df6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c6a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l314_c11_3def_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_37ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l322_c11_dbaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l328_c11_7b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_c06c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9e8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l317_DUPLICATE_a8cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l328_l322_l317_DUPLICATE_8dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l314_l310_l307_l302_l322_DUPLICATE_5470_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l314_l310_l336_l307_l332_l302_l328_l317_DUPLICATE_7e8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l317_l332_DUPLICATE_9c1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l317_l332_DUPLICATE_9c1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l314_l310_l307_l332_l302_l317_DUPLICATE_a3ae_return_output;
     -- n8_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output := n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- t8_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_1b61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_1753] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l320_c32_ed1b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_left;
     BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output := BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l322_c7_0ad0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l332_c7_1b61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output := result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_1753] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l320_c32_ed1b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_1753_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_1753_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_1b61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;

     -- t8_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- n8_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l328_c7_a9ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l328_c7_a9ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_1b61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;

     -- MUX[uxn_opcodes_h_l320_c32_fbfe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l320_c32_fbfe_cond <= VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_cond;
     MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue <= VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iftrue;
     MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse <= VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_return_output := MUX_uxn_opcodes_h_l320_c32_fbfe_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue := VAR_MUX_uxn_opcodes_h_l320_c32_fbfe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_1b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l328_c7_a9ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l322_c7_0ad0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output := result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l322_c7_0ad0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- t8_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l328_c7_a9ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l328_c7_a9ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- n8_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l322_c7_0ad0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l322_c7_0ad0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l322_c7_0ad0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- n8_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_d404] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_d404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l314_c7_e0a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l314_c7_e0a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_7eef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_7eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l307_c7_4d0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l307_c7_4d0e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l302_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l341_l298_DUPLICATE_9230 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l341_l298_DUPLICATE_9230_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l302_c2_4c5e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l341_l298_DUPLICATE_9230_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l341_l298_DUPLICATE_9230_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
