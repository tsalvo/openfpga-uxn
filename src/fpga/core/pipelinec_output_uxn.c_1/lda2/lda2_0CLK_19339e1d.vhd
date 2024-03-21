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
-- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_4714]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_5780]
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1761_c2_5780]
signal t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_5780]
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_5780]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_3c12]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_d8ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_95b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_5a4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1779_c3_bc9d]
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_6f65]
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_71cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1782_c3_5cb5]
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1783_c30_fe15]
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_0cef]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_0596]
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_0596]
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_0596]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_a75d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_f6e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_91cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_4d03]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_948d]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_948d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_948d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_948d]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- t16_MUX_uxn_opcodes_h_l1761_c2_5780
t16_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- t16_MUX_uxn_opcodes_h_l1774_c7_d8ef
t16_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c7_5a4b
t16_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d
CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x,
CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- t16_MUX_uxn_opcodes_h_l1781_c7_71cb
t16_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5
BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15
sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins,
sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x,
sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y,
sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_66a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_a44f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_cda9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_8166 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1788_c3_1454 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_9db5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_69ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_298f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1803_l1756_DUPLICATE_457d_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_a44f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_a44f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_cda9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_cda9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_69ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_69ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_66a0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_66a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_8166 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_8166;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_9db5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_9db5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse := tmp8_low;
     -- sp_relative_shift[uxn_opcodes_h_l1783_c30_fe15] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_ins;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_x;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output := sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_4d03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_0cef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_95b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_f6e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_5780_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_298f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_298f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_3c12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_4714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_5780_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_6f65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_left;
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output := BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_a75d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_4714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_3c12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_95b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_6f65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_0cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_f6e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_4d03_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1788_c3_1454 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_a75d_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_298f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_298f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_b367_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1774_l1786_l1777_l1761_DUPLICATE_124b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1796_l1790_DUPLICATE_6208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1790_DUPLICATE_5f1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_4072_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1786_l1781_l1777_l1774_l1761_l1796_DUPLICATE_0f26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_fe15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1788_c3_1454;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_948d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_948d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1779_c3_bc9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output := CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_948d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_948d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1782_c3_5cb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_left;
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output := BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_5cb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_bc9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_948d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_91cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_91cf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_0596] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_0596_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_71cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_71cb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_5a4b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_5a4b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_d8ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_d8ef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_5780] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output := tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_5780_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1803_l1756_DUPLICATE_457d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1803_l1756_DUPLICATE_457d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_5780_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1803_l1756_DUPLICATE_457d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1803_l1756_DUPLICATE_457d_return_output;
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
