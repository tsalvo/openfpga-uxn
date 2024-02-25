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
-- Submodules: 40
entity stz_0CLK_bacf6a1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_bacf6a1d;
architecture arch of stz_0CLK_bacf6a1d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_2477]
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1521_c2_23eb]
signal t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_afc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1534_c7_fd57]
signal t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_09cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1537_c7_068f]
signal n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_068f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_068f]
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_068f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_068f]
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_068f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1537_c7_068f]
signal t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_8fe1]
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_d91e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1542_c30_0b58]
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right,
BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output);

-- n8_MUX_uxn_opcodes_h_l1521_c2_23eb
n8_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- t8_MUX_uxn_opcodes_h_l1521_c2_23eb
t8_MUX_uxn_opcodes_h_l1521_c2_23eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond,
t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue,
t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse,
t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output);

-- n8_MUX_uxn_opcodes_h_l1534_c7_fd57
n8_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- t8_MUX_uxn_opcodes_h_l1534_c7_fd57
t8_MUX_uxn_opcodes_h_l1534_c7_fd57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond,
t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue,
t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse,
t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output);

-- n8_MUX_uxn_opcodes_h_l1537_c7_068f
n8_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- t8_MUX_uxn_opcodes_h_l1537_c7_068f
t8_MUX_uxn_opcodes_h_l1537_c7_068f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond,
t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue,
t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse,
t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output);

-- n8_MUX_uxn_opcodes_h_l1540_c7_d91e
n8_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58
sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins,
sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x,
sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y,
sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output,
 n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output,
 n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output,
 n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output,
 n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_cec3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_90cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_1f3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_fd57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_83ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1517_l1549_DUPLICATE_22e3_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_cec3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1526_c3_cec3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_90cb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1531_c3_90cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_1f3b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1535_c3_1f3b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y := resize(to_signed(-2, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1534_c11_afc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_8fe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1521_c6_2477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_left;
     BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output := BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_fd57_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1542_c30_0b58] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_ins;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_x;
     sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output := sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1544_c22_83ac] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_83ac_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1537_c11_09cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c6_2477_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c11_afc1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1537_c11_09cc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_8fe1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1544_c22_83ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_785c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_0058_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_7ca5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1540_l1534_l1537_DUPLICATE_e1fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1540_l1534_l1537_l1521_DUPLICATE_654e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1521_c2_23eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1542_c30_0b58_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_d91e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1540_c7_d91e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1537_c7_068f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1537_c7_068f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- n8_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1534_c7_fd57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output := result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;

     -- t8_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1534_c7_fd57_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1521_c2_23eb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_cond;
     n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iftrue;
     n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output := n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1517_l1549_DUPLICATE_22e3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1517_l1549_DUPLICATE_22e3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1521_c2_23eb_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1517_l1549_DUPLICATE_22e3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1517_l1549_DUPLICATE_22e3_return_output;
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
