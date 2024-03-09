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
-- Submodules: 71
entity lda2_0CLK_19339e1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_19339e1d;
architecture arch of lda2_0CLK_19339e1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_bc6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_0571]
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1761_c2_0571]
signal t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_0571]
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_0571]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_5bbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_5f34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_104b]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_397a]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c7_397a]
signal t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_397a]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_397a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1779_c3_2824]
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_6248]
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_22db]
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1781_c7_22db]
signal t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_22db]
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_22db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1782_c3_32eb]
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1783_c30_2451]
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_bf8e]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_34b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_283f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_28f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_223c]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_223c]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_223c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_223c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_223c]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_223c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_aab9]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_e94a]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_e94a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_e94a]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_e94a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- t16_MUX_uxn_opcodes_h_l1761_c2_0571
t16_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- t16_MUX_uxn_opcodes_h_l1774_c7_5f34
t16_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c7_397a
t16_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1779_c3_2824
CONST_SL_8_uxn_opcodes_h_l1779_c3_2824 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x,
CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- t16_MUX_uxn_opcodes_h_l1781_c7_22db
t16_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb
BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1783_c30_2451
sp_relative_shift_uxn_opcodes_h_l1783_c30_2451 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins,
sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x,
sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y,
sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp8_high,
 tmp8_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output,
 sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_3718 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_31a1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_d6a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1788_c3_ce3a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_1ed8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_997b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_452a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_4f6a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1803_l1756_DUPLICATE_29e1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_31a1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_31a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_3718 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_3718;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_997b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_997b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_d6a5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_d6a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_1ed8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_1ed8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_452a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_452a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output := result.u16_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_0571_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_aab9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_bc6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_28f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_0571_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_104b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1783_c30_2451] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_ins;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_x;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output := sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_283f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_5bbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_4f6a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_4f6a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_6248] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_left;
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output := BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_bf8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bc6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_5bbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_104b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_bf8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_28f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_aab9_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1788_c3_ce3a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_283f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_4f6a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_4f6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_ce91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_48b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1796_l1790_l1786_DUPLICATE_f72d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1790_l1786_DUPLICATE_0c2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_b343_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1781_l1777_l1774_l1761_l1796_l1786_DUPLICATE_9a5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_2451_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1788_c3_ce3a;
     -- BIN_OP_OR[uxn_opcodes_h_l1782_c3_32eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_left;
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output := BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_e94a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_e94a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_e94a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_e94a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1779_c3_2824] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output := CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_32eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e94a_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_223c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_223c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_34b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_34b0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- t16_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_22db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_22db_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- t16_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_397a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_397a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_5f34] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output := tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_5f34_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_0571] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output := tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_0571_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1803_l1756_DUPLICATE_29e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1803_l1756_DUPLICATE_29e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_0571_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_0571_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1803_l1756_DUPLICATE_29e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1803_l1756_DUPLICATE_29e1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
