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
-- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_e8bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_cfd8]
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_46f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_6bdd]
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_b3f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_e8d0]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1779_c3_2276]
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_a422]
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1781_c7_4895]
signal t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_4895]
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_4895]
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_4895]
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1782_c3_4213]
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1783_c30_60e8]
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_5852]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_c985]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_c985]
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_c985]
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_46b6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_6589]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_f103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_f103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_f103]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_f103]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_f103]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_f103]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_5de6]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_17e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_17e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_17e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_17e4]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output);

-- t16_MUX_uxn_opcodes_h_l1761_c2_cfd8
t16_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output);

-- t16_MUX_uxn_opcodes_h_l1774_c7_6bdd
t16_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c7_e8d0
t16_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1779_c3_2276
CONST_SL_8_uxn_opcodes_h_l1779_c3_2276 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x,
CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output);

-- t16_MUX_uxn_opcodes_h_l1781_c7_4895
t16_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213
BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8
sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins,
sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x,
sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y,
sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output,
 t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output,
 t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output,
 CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output,
 t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output,
 sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_d098 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_3fdc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_c0e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1788_c3_dd9c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_6967 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_2574 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_8189 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_a19c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1803_l1756_DUPLICATE_ef8f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_3fdc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_3fdc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_d098 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_d098;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_c0e7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_c0e7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_6967 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_6967;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_2574 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_2574;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_8189 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_8189;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_6589] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_5852] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_5de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_b3f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_a422] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_left;
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output := BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_e8bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1783_c30_60e8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_ins;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_x;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output := sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_46f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_46b6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_a19c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_a19c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_e8bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_46f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_b3f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_a422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_5852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_6589_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_5de6_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1788_c3_dd9c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_46b6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_a19c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_a19c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1777_l1774_l1786_DUPLICATE_5dc5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1777_l1761_l1774_l1786_DUPLICATE_de3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_l1796_DUPLICATE_ef99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_680e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1777_l1781_l1796_l1786_DUPLICATE_c760_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_2753_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_60e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1788_c3_dd9c;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_17e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_17e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_17e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1782_c3_4213] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_left;
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output := BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1779_c3_2276] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output := CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_17e4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_4213_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_2276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_17e4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_f103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- t16_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f103_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_c985] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output := tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_c985_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- t16_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_4895] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output := tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_4895_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_e8d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_e8d0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_6bdd] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output := tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_6bdd_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_cfd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1803_l1756_DUPLICATE_ef8f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1803_l1756_DUPLICATE_ef8f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_cfd8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1803_l1756_DUPLICATE_ef8f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1803_l1756_DUPLICATE_ef8f_return_output;
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
