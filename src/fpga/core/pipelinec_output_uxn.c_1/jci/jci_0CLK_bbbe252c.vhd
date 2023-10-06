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
-- Submodules: 86
entity jci_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_bbbe252c;
architecture arch of jci_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l70_c6_8a36]
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_cf3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_fdf7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l71_c3_3f32[uxn_opcodes_h_l71_c3_3f32]
signal printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_df02]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_811c]
signal t8_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_811c]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_811c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_fcea]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_647b]
signal t8_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_647b]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_647b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_fe04]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_f72b]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_f72b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_048a]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_abbb]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_abbb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_abbb]
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l90_c7_abbb]
signal result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_abbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_abbb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l93_c11_1616]
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l93_c7_28da]
signal tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_28da]
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_28da]
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l93_c7_28da]
signal result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_28da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_28da]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l95_c3_70ad]
signal CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_1399]
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l98_c11_7d69]
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l98_c7_15c2]
signal tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_15c2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_15c2]
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l98_c7_15c2]
signal result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_15c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_15c2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_1601]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l101_c11_715a]
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l101_c7_c1a2]
signal tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_c1a2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_c1a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_c1a2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l101_c7_c1a2]
signal result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l102_c3_e3b0]
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l105_c15_a782]
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_8bcc]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_ecd3]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_6fbd]
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l105_c15_754d]
signal MUX_uxn_opcodes_h_l105_c15_754d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_754d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_754d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l105_c15_754d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l107_c11_c791]
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_182c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_182c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_31a7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.pc := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right,
BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output);

-- t8_MUX_uxn_opcodes_h_l70_c2_fdf7
t8_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7
tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7
result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

-- printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32
printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32 : entity work.printf_uxn_opcodes_h_l71_c3_3f32_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02
BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_811c
t8_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_811c_cond,
t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_811c
tmp16_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l76_c7_811c
result_pc_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea
BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_647b
t8_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_647b_cond,
t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_647b
tmp16_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l79_c7_647b
result_pc_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04
BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_f72b
tmp16_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l85_c7_f72b
result_pc_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a
BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_abbb
tmp16_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l90_c7_abbb
result_pc_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616
BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right,
BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output);

-- tmp16_MUX_uxn_opcodes_h_l93_c7_28da
tmp16_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond,
tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- result_pc_MUX_uxn_opcodes_h_l93_c7_28da
result_pc_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond,
result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output);

-- CONST_SL_8_uxn_opcodes_h_l95_c3_70ad
CONST_SL_8_uxn_opcodes_h_l95_c3_70ad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x,
CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right,
BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69
BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right,
BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l98_c7_15c2
tmp16_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l98_c7_15c2
result_pc_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a
BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right,
BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2
tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond,
tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2
result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond,
result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue,
result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse,
result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0
BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left,
BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right,
BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782
BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right,
BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right,
BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output);

-- MUX_uxn_opcodes_h_l105_c15_754d
MUX_uxn_opcodes_h_l105_c15_754d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l105_c15_754d_cond,
MUX_uxn_opcodes_h_l105_c15_754d_iftrue,
MUX_uxn_opcodes_h_l105_c15_754d_iffalse,
MUX_uxn_opcodes_h_l105_c15_754d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791
BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right,
BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output,
 t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output,
 tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output,
 CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output,
 tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output,
 tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output,
 result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output,
 MUX_uxn_opcodes_h_l105_c15_754d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_b5dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_3d19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_811c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_dbca : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l96_c3_a26b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l99_c3_6514 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_754d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_754d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_754d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l105_c15_754d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_9c21_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_4c24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_31a7_uxn_opcodes_h_l112_l65_DUPLICATE_844f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_b5dd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_b5dd;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_dbca := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_dbca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_3d19 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_3d19;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right := to_unsigned(6, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l101_c11_715a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_left;
     BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output := BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l98_c11_7d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l70_c6_8a36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_left;
     BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output := BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l105_c15_a782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_left;
     BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output := BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l96_c21_1399] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_left;
     BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output := BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_df02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_9c21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_9c21_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c25_8bcc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_811c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_048a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l107_c11_c791] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_left;
     BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output := BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c21_1601] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_fe04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_fcea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_4c24 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_4c24_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l93_c11_1616] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_left;
     BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output := BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l101_c11_715a_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_754d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l105_c15_a782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l107_c11_c791_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l70_c6_8a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_df02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_fcea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_fe04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_048a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l93_c11_1616_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l98_c11_7d69_return_output;
     VAR_MUX_uxn_opcodes_h_l105_c15_754d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c25_8bcc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l96_c3_a26b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l96_c21_1399_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l99_c3_6514 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c21_1601_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_4c24_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l94_l102_DUPLICATE_4c24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l79_l70_DUPLICATE_8d92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l85_l93_l79_DUPLICATE_fc41_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l76_l79_l98_l70_DUPLICATE_5129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l76_l101_l90_l98_l85_l93_l107_l79_DUPLICATE_60c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l76_l70_l90_l98_l85_l93_l107_l79_DUPLICATE_3f4c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l76_l101_l70_l90_l98_l93_l79_DUPLICATE_c26e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l76_l85_l70_DUPLICATE_c806_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_9c21_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l76_l79_DUPLICATE_9c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l96_c3_a26b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l99_c3_6514;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output := t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_cf3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l102_c3_e3b0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_left;
     BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output := BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l101_c7_c1a2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l107_c7_182c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l95_c3_70ad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x <= VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output := CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l107_c7_182c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l102_c3_e3b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l95_c3_70ad_return_output;
     VAR_printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_cf3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l107_c7_182c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l107_c7_182c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- printf_uxn_opcodes_h_l71_c3_3f32[uxn_opcodes_h_l71_c3_3f32] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l71_c3_3f32_uxn_opcodes_h_l71_c3_3f32_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l101_c7_c1a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l101_c7_c1a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_cond;
     tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output := tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output := result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output := t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l101_c7_c1a2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_ecd3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_ecd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l105_c35_6fbd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- t8_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l105_c15_754d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l105_c35_6fbd_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- MUX[uxn_opcodes_h_l105_c15_754d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l105_c15_754d_cond <= VAR_MUX_uxn_opcodes_h_l105_c15_754d_cond;
     MUX_uxn_opcodes_h_l105_c15_754d_iftrue <= VAR_MUX_uxn_opcodes_h_l105_c15_754d_iftrue;
     MUX_uxn_opcodes_h_l105_c15_754d_iffalse <= VAR_MUX_uxn_opcodes_h_l105_c15_754d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l105_c15_754d_return_output := MUX_uxn_opcodes_h_l105_c15_754d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output := tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue := VAR_MUX_uxn_opcodes_h_l105_c15_754d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l101_c7_c1a2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_cond;
     result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output := result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l101_c7_c1a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l98_c7_15c2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_cond;
     result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output := result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l98_c7_15c2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l93_c7_28da] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_cond;
     result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iftrue;
     result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output := result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l93_c7_28da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l90_c7_abbb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_cond;
     result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output := result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l90_c7_abbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l85_c7_f72b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_cond;
     result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output := result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l85_c7_f72b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l79_c7_647b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_cond;
     result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output := result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l79_c7_647b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l76_c7_811c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_cond;
     result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output := result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output;

     -- Submodule level 12
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l76_c7_811c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l70_c2_fdf7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_cond;
     result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output := result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_31a7_uxn_opcodes_h_l112_l65_DUPLICATE_844f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_31a7_uxn_opcodes_h_l112_l65_DUPLICATE_844f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_31a7(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l70_c2_fdf7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_31a7_uxn_opcodes_h_l112_l65_DUPLICATE_844f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_31a7_uxn_opcodes_h_l112_l65_DUPLICATE_844f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
