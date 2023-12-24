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
-- Submodules: 58
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1861_c6_04cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1861_c2_c7cf]
signal t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_e6a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1874_c7_daa0]
signal t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_5de6]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1877_c7_1a2f]
signal t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_e5ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1882_c7_73ae]
signal t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1883_c3_f296]
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_e901]
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_adf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_5eda]
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1890_c7_ba6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1891_c3_b194]
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1892_c30_7ed5]
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1895_c21_88c9]
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1895_c21_8462]
signal MUX_uxn_opcodes_h_l1895_c21_8462_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_8462_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_8462_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1895_c21_8462_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1861_c2_c7cf
n16_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- t16_MUX_uxn_opcodes_h_l1861_c2_c7cf
t16_MUX_uxn_opcodes_h_l1861_c2_c7cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond,
t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue,
t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse,
t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_daa0
n16_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- t16_MUX_uxn_opcodes_h_l1874_c7_daa0
t16_MUX_uxn_opcodes_h_l1874_c7_daa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond,
t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue,
t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse,
t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output);

-- n16_MUX_uxn_opcodes_h_l1877_c7_1a2f
n16_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- t16_MUX_uxn_opcodes_h_l1877_c7_1a2f
t16_MUX_uxn_opcodes_h_l1877_c7_1a2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond,
t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue,
t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse,
t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1882_c7_73ae
n16_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1882_c7_73ae
t16_MUX_uxn_opcodes_h_l1882_c7_73ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond,
t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue,
t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse,
t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296
BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output);

-- n16_MUX_uxn_opcodes_h_l1886_c7_adf6
n16_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right,
BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output);

-- n16_MUX_uxn_opcodes_h_l1890_c7_ba6c
n16_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194
BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left,
BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right,
BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5
sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins,
sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x,
sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y,
sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9
BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left,
BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right,
BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output);

-- MUX_uxn_opcodes_h_l1895_c21_8462
MUX_uxn_opcodes_h_l1895_c21_8462 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1895_c21_8462_cond,
MUX_uxn_opcodes_h_l1895_c21_8462_iftrue,
MUX_uxn_opcodes_h_l1895_c21_8462_iffalse,
MUX_uxn_opcodes_h_l1895_c21_8462_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output,
 n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output,
 n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output,
 n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output,
 n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output,
 n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output,
 sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output,
 MUX_uxn_opcodes_h_l1895_c21_8462_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_574c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_7021 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_b468 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_de72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_13e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_04e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_8462_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1895_c21_8462_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_b6ea_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1899_l1857_DUPLICATE_1acc_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_de72 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1880_c3_de72;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_04e0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_04e0;
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_b468 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_b468;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_574c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1866_c3_574c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_13e4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1884_c3_13e4;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_7021 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_7021;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1892_c30_7ed5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_ins;
     sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_x;
     sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output := sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1890_c11_5eda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c6_04cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_e901] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_left;
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output := BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_5de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_e5ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_e6a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_b6ea LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_b6ea_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c6_04cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_e6a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_5de6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_e5ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e901_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1890_c11_5eda_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1878_l1883_l1887_l1891_DUPLICATE_4816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_7328_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_a03d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1877_l1874_l1890_l1886_l1882_DUPLICATE_0cde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_b6ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1886_l1890_DUPLICATE_b6ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1877_l1874_l1861_l1890_l1886_l1882_DUPLICATE_b8f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1892_c30_7ed5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1891_c3_b194] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_left;
     BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output := BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1883_c3_f296] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_left;
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output := BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_f296_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1891_c3_b194_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1879_l1888_DUPLICATE_fd3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1895_c21_88c9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_left;
     BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output := BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1895_c21_8462_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1895_c21_88c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- MUX[uxn_opcodes_h_l1895_c21_8462] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1895_c21_8462_cond <= VAR_MUX_uxn_opcodes_h_l1895_c21_8462_cond;
     MUX_uxn_opcodes_h_l1895_c21_8462_iftrue <= VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iftrue;
     MUX_uxn_opcodes_h_l1895_c21_8462_iffalse <= VAR_MUX_uxn_opcodes_h_l1895_c21_8462_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1895_c21_8462_return_output := MUX_uxn_opcodes_h_l1895_c21_8462_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue := VAR_MUX_uxn_opcodes_h_l1895_c21_8462_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1890_c7_ba6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1890_c7_ba6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_adf6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_adf6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_73ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_73ae_return_output;
     -- n16_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1877_c7_1a2f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1877_c7_1a2f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1874_c7_daa0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1874_c7_daa0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1861_c2_c7cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1899_l1857_DUPLICATE_1acc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1899_l1857_DUPLICATE_1acc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1861_c2_c7cf_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1899_l1857_DUPLICATE_1acc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1899_l1857_DUPLICATE_1acc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
