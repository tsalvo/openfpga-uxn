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
-- Submodules: 54
entity jcn_0CLK_81936ba3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_81936ba3;
architecture arch of jcn_0CLK_81936ba3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l692_c6_975c]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l692_c2_ac99]
signal t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c2_ac99]
signal n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c2_ac99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_5ad5]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_cd1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_89df]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l700_c7_7028]
signal t8_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l700_c7_7028]
signal n8_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_7028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l704_c11_f511]
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l704_c7_0672]
signal n8_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_0672]
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_9352]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_d70c]
signal n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_d70c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l707_c7_d70c]
signal result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_d70c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_d70c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_d70c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l710_c32_86d7]
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l710_c32_e66f]
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l710_c32_47cf]
signal MUX_uxn_opcodes_h_l710_c32_47cf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_47cf_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_47cf_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_47cf_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l712_c15_dbf0]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l712_c30_5a93]
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l712_c15_b6dd]
signal MUX_uxn_opcodes_h_l712_c15_b6dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_b6dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_789a]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f07d( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c
BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output);

-- t8_MUX_uxn_opcodes_h_l692_c2_ac99
t8_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c2_ac99
n8_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_pc_MUX_uxn_opcodes_h_l692_c2_ac99
result_pc_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5
BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output);

-- t8_MUX_uxn_opcodes_h_l697_c7_cd1c
t8_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- n8_MUX_uxn_opcodes_h_l697_c7_cd1c
n8_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c
result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df
BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output);

-- t8_MUX_uxn_opcodes_h_l700_c7_7028
t8_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l700_c7_7028_cond,
t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- n8_MUX_uxn_opcodes_h_l700_c7_7028
n8_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l700_c7_7028_cond,
n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_pc_MUX_uxn_opcodes_h_l700_c7_7028
result_pc_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511
BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output);

-- n8_MUX_uxn_opcodes_h_l704_c7_0672
n8_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l704_c7_0672_cond,
n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_pc_MUX_uxn_opcodes_h_l704_c7_0672
result_pc_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352
BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_d70c
n8_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l707_c7_d70c
result_pc_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7
BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left,
BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right,
BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f
BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left,
BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right,
BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output);

-- MUX_uxn_opcodes_h_l710_c32_47cf
MUX_uxn_opcodes_h_l710_c32_47cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l710_c32_47cf_cond,
MUX_uxn_opcodes_h_l710_c32_47cf_iftrue,
MUX_uxn_opcodes_h_l710_c32_47cf_iffalse,
MUX_uxn_opcodes_h_l710_c32_47cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0
BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left,
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right,
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output);

-- MUX_uxn_opcodes_h_l712_c15_b6dd
MUX_uxn_opcodes_h_l712_c15_b6dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l712_c15_b6dd_cond,
MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue,
MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse,
MUX_uxn_opcodes_h_l712_c15_b6dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a
BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output,
 t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output,
 t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output,
 t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output,
 n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output,
 MUX_uxn_opcodes_h_l710_c32_47cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output,
 MUX_uxn_opcodes_h_l712_c15_b6dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_bf51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_4f1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9edd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_8cf5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_0672_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_47cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_47cf_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_8a88_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l720_l688_DUPLICATE_7b02_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right := to_unsigned(128, 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_4f1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_4f1b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_bf51 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_bf51;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9edd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_9edd;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_8cf5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_8cf5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l712_c35_8a88] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_8a88_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c6_975c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_89df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c15_dbf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_9352] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l710_c32_86d7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_left;
     BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output := BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_789a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_5ad5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_0672_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l704_c11_f511] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_left;
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output := BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_86d7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_975c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_5ad5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_89df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_f511_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_9352_return_output;
     VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_dbf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_789a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_8a88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_4d93_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l704_l707_l692_l697_DUPLICATE_7b9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l704_l707_l714_l697_DUPLICATE_6c68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_8c5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l704_l692_l714_l697_DUPLICATE_f7be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_0672_return_output;
     -- n8_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- t8_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output := t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l712_c30_5a93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_left;
     BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output := BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l710_c32_e66f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_left;
     BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output := BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l710_c32_47cf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_e66f_return_output;
     VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_5a93_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- t8_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- n8_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output := n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- MUX[uxn_opcodes_h_l710_c32_47cf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l710_c32_47cf_cond <= VAR_MUX_uxn_opcodes_h_l710_c32_47cf_cond;
     MUX_uxn_opcodes_h_l710_c32_47cf_iftrue <= VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iftrue;
     MUX_uxn_opcodes_h_l710_c32_47cf_iffalse <= VAR_MUX_uxn_opcodes_h_l710_c32_47cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l710_c32_47cf_return_output := MUX_uxn_opcodes_h_l710_c32_47cf_return_output;

     -- MUX[uxn_opcodes_h_l712_c15_b6dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l712_c15_b6dd_cond <= VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_cond;
     MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue <= VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iftrue;
     MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse <= VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_return_output := MUX_uxn_opcodes_h_l712_c15_b6dd_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := VAR_MUX_uxn_opcodes_h_l710_c32_47cf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue := VAR_MUX_uxn_opcodes_h_l712_c15_b6dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_n8_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_t8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     -- n8_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output := n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- t8_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_d70c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l704_c7_0672] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_cond;
     result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iftrue;
     result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output := result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- n8_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_n8_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_0672_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l700_c7_7028] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_cond;
     result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iftrue;
     result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output := result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_7028_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_cd1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_cd1c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c2_ac99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l720_l688_DUPLICATE_7b02 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l720_l688_DUPLICATE_7b02_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f07d(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_ac99_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_ac99_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l720_l688_DUPLICATE_7b02_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l720_l688_DUPLICATE_7b02_return_output;
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
